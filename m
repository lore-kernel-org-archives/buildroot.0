From: Jon Ambrose <jonathan.ambrose@live.uwe.ac.uk>
Date: Fri, 19 Nov 2010 09:42:31 +0000
Subject: [Buildroot] Buildroot with Festival Speech Synthesis
Message-ID: <SNT105-DS221E1A5B7AB480C899C224EB3A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

 

I am still having issues with Alsa-lib at the moment but  I have noticed
Festival (bigger version of Flite) within buildroot - have you had any
experience of this? This would be sat on a ARM 9 Processor

 

I am trying to compile it within Busybox, and getting the following errors:

 

wagon_main.o: In function `wagon_main(int, char**)':

wagon_main.cc:(.text+0x10c0): undefined reference to `wgn_held_out'

wagon_main.cc:(.text+0x10c8): undefined reference to `wgn_balance'

wagon_main.cc:(.text+0x10e4): undefined reference to `wgn_min_cluster_size'

wagon_main.cc:(.text+0x10f0): undefined reference to `wgn_predictee_name'

wagon_main.cc:(.text+0x10f8): undefined reference to `wgn_count_field_name'

wagon_main.cc:(.text+0x1104): undefined reference to `wgn_float_range_split'

wagon_main.cc:(.text+0x110c): undefined reference to `wgn_opt_param'

wagon_main.cc:(.text+0x1134): undefined reference to `wgn_dataset'

wagon_main.cc:(.text+0x115c): undefined reference to `wgn_vertex_output'

wagon_main.cc:(.text+0x1160): undefined reference to `wgn_prune'

wagon_main.cc:(.text+0x1164): undefined reference to `wgn_verbose'

wagon_main.cc:(.text+0x1168): undefined reference to `wgn_quiet'

wagon_main.cc:(.text+0x116c): undefined reference to `wgn_DistMatrix'

wagon_main.cc:(.text+0x1174): undefined reference to `wgn_VertexTrack_end'

wagon_main.cc:(.text+0x117c): undefined reference to `wgn_VertexTrack_start'

wagon_main.cc:(.text+0x1180): undefined reference to `wgn_VertexTrack'

wagon_main.cc:(.text+0x1b88): undefined reference to
`wgn_load_datadescription(EST_String, obj*)'

wagon_main.cc:(.text+0x1c5c): undefined reference to
`wgn_load_dataset(WDataSet&, EST_String)'

wagon_main.cc:(.text+0x2438): undefined reference to
`wgn_load_dataset(WDataSet&, EST_String)'

wagon_main.cc:(.text+0x24a4): undefined reference to
`wgn_build_dlist(float&, std::basic_ostream<char, std::char_traits<char>
>*)'

wagon_main.cc:(.text+0x24c0): undefined reference to
`operator<<(std::basic_ostream<char, std::char_traits<char> >&, WNode&)'

wagon_main.cc:(.text+0x24d0): undefined reference to
`summary_results(WNode&, std::basic_ostream<char, std::char_traits<char>
>*)'

wagon_main.cc:(.text+0x2634): undefined reference to `wagon_stepwise(float)'

wagon_main.cc:(.text+0x298c): undefined reference to
`wgn_build_tree(float&)'

wagon_main.cc:(.text+0x3138): undefined reference to `wgn_VertexTrack_end'

wagon_main.cc:(.text+0x313c): undefined reference to `wgn_VertexTrack_start'

wagon_main.cc:(.text+0x3140): undefined reference to `wgn_VertexTrack'

wagon_main.cc:(.text+0x314c): undefined reference to `wgn_UnitTrack'

wagon_main.cc:(.text+0x3154): undefined reference to `wgn_test_dataset'

 

 

and a number of other files, wagon_test_main.cc

 

Do you know whether this is supposed to work?

 

Best regards,

 

Jon Ambrose

 

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101119/7f04e939/attachment-0001.html>
