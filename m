From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 10:15:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/wf111: bump to version 5.2.2-r3
In-Reply-To: <20180126162021.5520-1-corjon.j@ecagroup.com> (Julien Corjon's
 message of "Fri, 26 Jan 2018 17:20:21 +0100")
References: <20180126162021.5520-1-corjon.j@ecagroup.com>
Message-ID: <877es3irx9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Corjon <corjon.j@ecagroup.com> writes:

 > Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
 > ---
 >  package/wf111/wf111.mk | 8 ++++----
 >  1 file changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
 > index ad9d89149d..ed55672136 100644
 > --- a/package/wf111/wf111.mk
 > +++ b/package/wf111/wf111.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -WF111_VERSION = 5.2.2-r2
 > +WF111_VERSION = 5-2-2-r3

The Config.in refers to
http://www.bluegiga.com/en-US/products/wifi-modules/wf111-wifi-module/,
which redirects to silabs.com nowadays, so it is not directly clear
where to find the tarballs.

Care to send a patch updating Config.in?

Committed, thanks.

-- 
Bye, Peter Korsgaard
