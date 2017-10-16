From: Anisse Astier <anisse@astier.eu>
Date: Mon, 16 Oct 2017 18:23:51 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <1508170801-31062-1-git-send-email-anisse@astier.eu>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
Message-ID: <20171016162351.GA31117@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 16, 2017 at 06:20:01PM +0200, Anisse Astier wrote:
> This includes a new support script that helps parsing *_CMDS recipes,
> ensuring everything is forwarded.
> 
> See also: http://repo.or.cz/buildroot-gz.git/commitdiff/833e8fa7c7437931f1356b5b03a6b3810a3db586
> Latest discussion: http://lists.busybox.net/pipermail/buildroot/2017-October/204159.html
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
> 
> This is a proof of concept and does not log everything yet, but should work.
> 
> 

Note that I initially wanted to do the support script in pure shell, but
stumbled on nested double quotes and other lexing issues, so I gave up.
See attachment (not working) for what it could have been.

Regards,

Anisse

-------------- next part --------------
A non-text attachment was scrubbed...
Name: recipe-forward-log.sh
Type: application/x-sh
Size: 1447 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171016/0b589f11/attachment.sh>
