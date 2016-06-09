From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:19:36 +0200
Subject: [Buildroot] [PATCH 2/2] enable amcodec if it is set in the
 config. based on the libreelec implementation.
In-Reply-To: <20160609074644.4976-2-daggs@gmx.com>
References: <20160609074644.4976-1-daggs@gmx.com>
 <20160609074644.4976-2-daggs@gmx.com>
Message-ID: <20160609101936.17ff1ed5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Jun 2016 10:46:44 +0300, Dagg Stompler wrote:
> Signed-off-by: Dagg Stompler <daggs@gmx.com>

The commit log should rather look like:

	kodi: enable optional dependency on libamcodec

	This is based on what LibreELEC is doing.

Indeed, the commit title should always have the form:

	<package>: <description>.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
