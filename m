From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Nov 2012 00:22:25 +0100
Subject: [Buildroot] Improving config navigation for mtd tools
In-Reply-To: <CAE21AQqPOGLxFVdCjaFpPo1x2kXCSo3+VbwvYk=THKfRbk+-UQ@mail.gmail.com>
References: <CAE21AQqPOGLxFVdCjaFpPo1x2kXCSo3+VbwvYk=THKfRbk+-UQ@mail.gmail.com>
Message-ID: <50B7EE31.90300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/11/12 01:12, Charles Manning wrote:
> Hello All
>
> The mtd utilities are part flash utilities and part file system
> utilities. This makes it a bit cryptic to put them under "Filesystem
> utilities".
>
> I suggest this can be resolved by remaining the heading to "Filesystem
> and flash utilities"

  Thank you, that's a good idea.  Could you post a proper patch?
That means:

- Write a commit message that documents the change (more
or less what you wrote above).

- Add a Signed-off-by line for yourself.  This is a short way for you to
assert that you are entitled to contribute the patch under buildroot's
GPL license.  See  http://elinux.org/Developer_Certificate_Of_Origin
for more details.

- Preferably send it with git-send-email.

  This will also add you to the list of buildroot contributors :-)

  Regards,
  Arnout

>
>
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -177,7 +177,7 @@ source "package/xterm/Config.in"
>   source "package/xvkbd/Config.in"
>   endmenu
>
> -menu "Filesystem utilities"
> +menu "Filesystem and flash utilities"
>   source "package/cifs-utils/Config.in"
>   source "package/cramfs/Config.in"
>   source "package/dosfstools/Config.in"
>
>
> Regards
>
> Charles
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
