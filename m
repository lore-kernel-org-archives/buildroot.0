From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 19:36:47 +0100
Subject: [Buildroot] [PATCH/next 09/13]
 package/x11r7/xserver_xorg-server: add version 1.18.0
In-Reply-To: <t4suhcxhbi.ln2@ID-313208.user.individual.net>
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
 <1447457203-27816-9-git-send-email-bernd.kuhls@t-online.de>
 <878u60i5me.fsf@dell.be.48ers.dk>
 <qrpkhcx89o.ln2@ID-313208.user.individual.net>
 <t4suhcxhbi.ln2@ID-313208.user.individual.net>
Message-ID: <20151118193647.174c0d32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 18 Nov 2015 19:20:45 +0100, Bernd Kuhls wrote:

> > nvidia-driver depends on ABI 19 (yes, I will send a patch in the next
> > minutes, I do not use Nvidia hardware so i forgot about it), it is
> > broken with X.org 1.18.0:
> 
> Nvidia issued an update, I will post a new patch series in the coming 
> days: http://www.nvidia.com/download/driverResults.aspx/95154/en-us

So thanks to this update we won't have to keep the ABI 19 compatible
X.org server version, right?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
