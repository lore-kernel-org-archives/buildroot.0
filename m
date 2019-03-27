From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:18:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: security bump to
 version 1.8.4
In-Reply-To: <20190327203714.3629-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 27 Mar 2019 21:37:14 +0100")
References: <20190327203714.3629-1-fontaine.fabrice@gmail.com>
Message-ID: <87ef6sotaf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch site to github
 > - Remove second patch (already in version)
 > - Add hash for license file
 > - Fix memory corruption in process_bitmap_data - CVE-2018-8794
 > - Fix remote code execution in process_bitmap_data - CVE-2018-8795
 > - Fix remote code execution in process_plane - CVE-2018-8797
 > - Fix Denial of Service in mcs_recv_connect_response - CVE-2018-20175
 > - Fix Denial of Service in mcs_parse_domain_params - CVE-2018-20175
 > - Fix Denial of Service in sec_parse_crypt_info - CVE-2018-20176
 > - Fix Denial of Service in sec_recv - CVE-2018-20176
 > - Fix minor information leak in rdpdr_process - CVE-2018-8791
 > - Fix Denial of Service in cssp_read_tsrequest - CVE-2018-8792
 > - Fix remote code execution in cssp_read_tsrequest - CVE-2018-8793
 > - Fix Denial of Service in process_bitmap_data - CVE-2018-8796
 > - Fix minor information leak in rdpsnd_process_ping - CVE-2018-8798
 > - Fix Denial of Service in process_secondary_order - CVE-2018-8799
 > - Fix remote code execution in in ui_clip_handle_data - CVE-2018-8800
 > - Fix major information leak in ui_clip_handle_data - CVE-2018-20174
 > - Fix memory corruption in rdp_in_unistr - CVE-2018-20177
 > - Fix Denial of Service in process_demand_active - CVE-2018-20178
 > - Fix remote code execution in lspci_process - CVE-2018-20179
 > - Fix remote code execution in rdpsnddbg_process - CVE-2018-20180
 > - Fix remote code execution in seamless_process - CVE-2018-20181
 > - Fix remote code execution in seamless_process_line - CVE-2018-20182

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
