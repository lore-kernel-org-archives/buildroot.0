From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 02:24:14 +0100
Subject: [Buildroot] [PATCH 2/3] test/support/download/git: new test
In-Reply-To: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
References: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
 <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
Message-ID: <43363991-9d33-1b7c-7279-948cc2c1b2f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-11-16 20:33, Ricardo Martincoski wrote:
> This test assumes:
> - it is run from the buildroot base dir;
> - there is a ssh server installed;
> - there is a key pair to allow the current user to ssh to localhost
>   without being prompted for a password;
> - there is no ./.config ./stdout ./package/package;
> 
> For each testcase, it creates a new git repo, and then download from
> this repo using a fake package named 'package'.

 I've given comments on this patch which I think are important, so I've marked
it as Changes Requested in patchwork. However, patch 3/3 can be committed
without this one.

 Regards,
 Arnout

> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> ---
> This test needs some instrumentation in the source code (previous patch)
> to work properly.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
