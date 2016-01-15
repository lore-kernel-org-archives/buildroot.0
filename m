From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Jan 2016 14:58:48 -0300
Subject: [Buildroot] [PATCH] Config.in: Add BR2_DEPRECATED_SINCE_2016_02
In-Reply-To: <87twmeybde.fsf@dell.be.48ers.dk>
References: <1452854866-25826-1-git-send-email-gustavo@zacarias.com.ar>
 <87twmeybde.fsf@dell.be.48ers.dk>
Message-ID: <56993358.2050509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/01/16 14:57, Peter Korsgaard wrote:

> And we're already using it in linux-headers.
>
> Committed, thanks.

Hi, yes.
I forgot to mention it when splitting other patches from my series that 
depend upon the openssl legacy (that removes libungif, the old 
deprecated symbol and headers 3.16.x).
If openssl stalls i'll reorder/rebase to get them out of the way - 
though those aren't are hard req.
Regards.
