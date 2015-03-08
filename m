From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 14:45:13 +0100
Subject: [Buildroot] [PATCH] openldap: Make client binary install
 configurable
In-Reply-To: <1424187838-739-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1424187838-739-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20150308144513.18158de2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan S?rensen,

On Tue, 17 Feb 2015 16:43:58 +0100, Stefan S?rensen wrote:
> Some OpenLDAP deployment only need the client libraries and not the client
> tools, so make the tool installation optional.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Thanks, I've applied, after rewriting the logic to use a make "foreach"
loop rather than a shell "for" loop.

See
http://git.buildroot.net/buildroot/commit/?id=c6aa56e081bd31981a547d8f2db060fe05a75d57.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
