From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 22 Jun 2019 14:13:09 -0500
Subject: [Buildroot] [PATCH v2 1/3] autobuild-run: create reason file on
 build failures
In-Reply-To: <20190622204957.587b1635@windsurf>
References: <20190622184118.5627-1-itsatharva@gmail.com>
 <20190622204957.587b1635@windsurf>
Message-ID: <CABM+sgpU8sb+eTREBSWT8OvE8mD02czd1t6TvfhgE_6eRLT88w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 22, 2019 at 1:50 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

>
> Why do we have this "-".join(reason) instead of just writing the
> contents of the "reason" variable to the file ?
>

The reason to do that is to achieve the same formatting for the failure
reason
as the PHP script that is "package-version"

Regards,
Atharva Lele
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190622/2507a460/attachment.html>
