From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 09:31:14 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql --with-libxml configure
 option added
In-Reply-To: <AD312B93A689234094FC24F3B98DBF33437A1708@INNO-EX-2010.innovaphone.sifi>
References: <20180608062231.2345-1-dde@innovaphone.com>
 <F73717A01AEC1F4CB9A3D10E39CBB88F4424CD47@INNO-EX-2010.innovaphone.sifi>
 <F73717A01AEC1F4CB9A3D10E39CBB88F443662EA@INNO-EX-2010.innovaphone.sifi>
 <AD312B93A689234094FC24F3B98DBF33437A1708@INNO-EX-2010.innovaphone.sifi>
Message-ID: <20180727093114.4943db9a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 27 Jul 2018 07:06:48 +0000, Thomas Ehrhardt wrote:
> The postgresql package is now built with --with-libxml if BR2_PACKAGE_LIBXML2 is selected to allow the use of XML functions in postgresql.
> 
> Signed-off-by: Daniel Deterding <dde@innovaphone.com>

Thanks for your patch, it looks good, but there's one issue: the From
doesn't match the Signed-off-by.

If I understand correctly, the patch was done by your colleague Daniel
Deterding, and you are sending it on his behalf. If that is correct,
then you need to add your own Signed-off-by below the one from Daniel.

While you're at it, could you fix the minor issues below (I had fixed
them locally as I was about to apply the patch, but realized the
Signed-off-by issue) :

 - The commit title should have the format:

   <package>: <description>

   A better commit title is:

   postgresql: add optional dependency on libxml2

 - The commit log text should be wrapped at 72 characters.

Except these, it looks good. Could you resend an updated version ?

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
