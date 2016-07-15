From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 22:25:25 +0200
Subject: [Buildroot] [PATCH v2] nginx-upload-module: new package
In-Reply-To: <1468552217-17318-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1468552217-17318-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160715222525.10c40692@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 22:10:17 -0500, Matt Weber wrote:
> From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>
> 
> A module for nginx web server for handling file uploads using
> multipart/form-data encoding (RFC 1867).
> 
> Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Applied with the following changes:

    [Thomas:
     - rename from nginx-upload-module to nginx-upload. Indeed, we don't
       want all nginx modules to be suffixed with "-module"
     - include the module Config.in file directly from package/Config.in,
       like we do for Python, Perl, Lua or TCL modules.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
