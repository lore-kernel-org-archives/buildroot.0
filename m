From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Feb 2021 20:21:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/pugixml: bump to version 1.11.4
In-Reply-To: <CAPi7W83ftPo1VBrG1JiLTdNv=Euv51YpTp5_iQ0ORnW3ZTOTWw@mail.gmail.com>
 (Fabrice Fontaine's message of "Mon, 1 Feb 2021 19:23:52 +0100")
References: <20210201174818.936752-1-fontaine.fabrice@gmail.com>
 <87im7blkcm.fsf@dell.be.48ers.dk>
 <CAPi7W83ftPo1VBrG1JiLTdNv=Euv51YpTp5_iQ0ORnW3ZTOTWw@mail.gmail.com>
Message-ID: <877dnpgdpb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Dear Peter,
 > Le lun. 1 f?vr. 2021 ? 19:21, Peter Korsgaard <peter@korsgaard.com> a ?crit :
 >> 
 >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > - Use LICENSE.md which has been added in the release tarball since
 >> >   version 1.11 and
 >> >   https://github.com/zeux/pugixml/commit/ccb63a91865b59d3a4c1dde61fecf12ec085c089
 >> > - Fix a build failure with gerbera >= 1.5.0 when building pugixml in
 >> >   header-only mode
 >> 
 >> So that means that this needs to be backported to 2020.02.x / 2020.11.x
 >> as well?
 > Yes.

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
