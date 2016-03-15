define firewall_multi::icmp (
  # source, destination and icmp are expected to be in $name.
  # all arguments are proxied to the puppetlabs/firewall type.
  $ensure                = undef,
  $action                = undef,
  $burst                 = undef,
  $clusterip_new         = undef,
  $clusterip_hashmode    = undef,
  $clusterip_clustermac  = undef,
  $clusterip_total_nodes = undef,
  $clusterip_local_node  = undef,
  $clusterip_hash_init   = undef,
  $chain                 = undef,
  $checksum_fill         = undef,
  $clamp_mss_to_pmtu     = undef,
  $connlimit_above       = undef,
  $connlimit_mask        = undef,
  $connmark              = undef,
  $ctstate               = undef,
  $date_start            = undef,
  $date_stop             = undef,
  $dport                 = undef,
  $dst_range             = undef,
  $dst_type              = undef,
  $gateway               = undef,
  $gid                   = undef,
  $hop_limit             = undef,
  $iniface               = undef,
  $ipsec_dir             = undef,
  $ipsec_policy          = undef,
  $ipset                 = undef,
  $isfirstfrag           = undef,
  $isfragment            = undef,
  $ishasmorefrags        = undef,
  $islastfrag            = undef,
  $jump                  = undef,
  $kernel_timezone       = undef,
  $limit                 = undef,
  $line                  = undef,
  $log_level             = undef,
  $log_prefix            = undef,
  $log_uid               = undef,
  $mask                  = undef,
  $month_days            = undef,
  $match_mark            = undef,
  $mss                   = undef,
  $outiface              = undef,
  $physdev_in            = undef,
  $physdev_out           = undef,
  $physdev_is_bridged    = undef,
  $pkttype               = undef,
  $proto                 = undef,
  $provider              = undef,
  $random                = undef,
  $rdest                 = undef,
  $reap                  = undef,
  $recent                = undef,
  $reject                = undef,
  $rhitcount             = undef,
  $rname                 = undef,
  $rseconds              = undef,
  $rsource               = undef,
  $rttl                  = undef,
  $set_dscp              = undef,
  $set_dscp_class        = undef,
  $set_mark              = undef,
  $set_mss               = undef,
  $socket                = undef,
  $sport                 = undef,
  $src_range             = undef,
  $src_type              = undef,
  $stat_every            = undef,
  $stat_mode             = undef,
  $stat_packet           = undef,
  $stat_probability      = undef,
  $state                 = undef,
  $table                 = undef,
  $tcp_flags             = undef,
  $time_contiguous       = undef,
  $time_start            = undef,
  $time_stop             = undef,
  $todest                = undef,
  $toports               = undef,
  $tosource              = undef,
  $to                    = undef,
  $uid                   = undef,
  $week_days             = undef,
) {

  # $name is expected to contain something like
  # 'description__x.x.x.x/x__y.y.y.y/y__nn' (or
  # 'description__undef__y.y.y.y/y__undef' etc)

  # $_name will afterwards contain
  #  'description from x.x.x.x/x to y.y.y.y/y icmp type nn'
  # or 'description from x.x.x.x/x'
  # or 'description to y.y.y.y/y'
  # or 'description icmp type nn' etc.
  # or just description if none of the above.

  $_name = regsubst(regsubst(regsubst(regsubst(regsubst(regsubst(
    $name, '__', ' from '), '__', ' to '), '__', ' icmp type '),
      ' from undef', ''), ' to undef', ''), ' icmp type undef', '')

  # array will contain three elements:
  # array[0]  - contains description (discarded; we use $_name instead)
  # array[1]  - contains x.x.x.x/x
  # array[2]  - contains y.y.y.y/y
  # array[3]  - contains nn
  $array = split($name, '__')

  if $array[1] == 'undef' {
    $source = undef
  } else {
    $source = $array[1]
  }
  if $array[2] == 'undef' {
    $destination = undef
  } else {
    $destination = $array[2]
  }
  if $array[3] == 'undef' {
    $icmp = undef
  } else {
    $icmp = $array[3]
  }

  firewall { $_name:
    # I put this here to make the Forge's lint happy.
    ensure                => $ensure,
    source                => $source,
    destination           => $destination,
    icmp                  => $icmp,
    # all other arguments are proxied to the puppetlabs/firewall type.
    action                => $action,
    burst                 => $burst,
    clusterip_new         => $clusterip_new,
    clusterip_hashmode    => $clusterip_hashmode,
    clusterip_clustermac  => $clusterip_clustermac,
    clusterip_total_nodes => $clusterip_total_nodes,
    clusterip_local_node  => $clusterip_local_node,
    clusterip_hash_init   => $clusterip_hash_init,
    chain                 => $chain,
    checksum_fill         => $checksum_fill,
    clamp_mss_to_pmtu     => $clamp_mss_to_pmtu,
    connlimit_above       => $connlimit_above,
    connlimit_mask        => $connlimit_mask,
    connmark              => $connmark,
    ctstate               => $ctstate,
    date_start            => $date_start,
    date_stop             => $date_stop,
    dport                 => $dport,
    dst_range             => $dst_range,
    dst_type              => $dst_type,
    gateway               => $gateway,
    gid                   => $gid,
    hop_limit             => $hop_limit,
    iniface               => $iniface,
    ipsec_dir             => $ipsec_dir,
    ipsec_policy          => $ipsec_policy,
    ipset                 => $ipset,
    isfirstfrag           => $isfirstfrag,
    isfragment            => $isfragment,
    ishasmorefrags        => $ishasmorefrags,
    islastfrag            => $islastfrag,
    jump                  => $jump,
    kernel_timezone       => $kernel_timezone,
    limit                 => $limit,
    line                  => $line,
    log_level             => $log_level,
    log_prefix            => $log_prefix,
    log_uid               => $log_uid,
    mask                  => $mask,
    month_days            => $month_days,
    match_mark            => $match_mark,
    mss                   => $mss,
    outiface              => $outiface,
    physdev_in            => $physdev_in,
    physdev_out           => $physdev_out,
    physdev_is_bridged    => $physdev_is_bridged,
    pkttype               => $pkttype,
    proto                 => $proto,
    provider              => $provider,
    random                => $random,
    rdest                 => $rdest,
    reap                  => $reap,
    recent                => $recent,
    reject                => $reject,
    rhitcount             => $rhitcount,
    rname                 => $rname,
    rseconds              => $rseconds,
    rsource               => $rsource,
    rttl                  => $rttl,
    set_dscp              => $set_dscp,
    set_dscp_class        => $set_dscp_class,
    set_mark              => $set_mark,
    set_mss               => $set_mss,
    socket                => $socket,
    sport                 => $sport,
    src_range             => $src_range,
    src_type              => $src_type,
    stat_every            => $stat_every,
    stat_mode             => $stat_mode,
    stat_packet           => $stat_packet,
    stat_probability      => $stat_probability,
    state                 => $state,
    table                 => $table,
    tcp_flags             => $tcp_flags,
    time_contiguous       => $time_contiguous,
    time_start            => $time_start,
    time_stop             => $time_stop,
    todest                => $todest,
    toports               => $toports,
    tosource              => $tosource,
    to                    => $to,
    uid                   => $uid,
    week_days             => $week_days,
  }
}
