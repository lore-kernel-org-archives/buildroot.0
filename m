From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 6 Sep 2016 16:44:49 -0300
Subject: [Buildroot] [PATCH] libgtk3: fix typo
In-Reply-To: <87d1kget6s.fsf@dell.be.48ers.dk>
References: <1473110212-14012-1-git-send-email-gustavo@zacarias.com.ar>
 <87d1kget6s.fsf@dell.be.48ers.dk>
Message-ID: <e83a8da6-aa6d-d054-f749-7ff3eaa34a08@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/16 16:15, Peter Korsgaard wrote:

>  > It's wayland, not waylandd, hence gtk3+ with the wayland backend went
>  > completely poof.
>
>  > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> Gaah, I guess this is a candidate for 2016.08.1 :/

Hi.
Not really, since this was caused by the libegl-wayland patchset which 
was in -next.
Regards.
