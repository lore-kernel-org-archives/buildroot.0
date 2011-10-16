From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 16 Oct 2011 00:04:08 -0300
Subject: [Buildroot] [PATCH 15/25] vala: new package
In-Reply-To: <87k486rm4q.fsf@macbook.be.48ers.dk>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
 <1318648059-30431-15-git-send-email-gustavo@zacarias.com.ar>
 <87k486rm4q.fsf@macbook.be.48ers.dk>
Message-ID: <12a79c04458aae39e0858fd4c57d2921@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15.10.2011 18:16, Peter Korsgaard wrote:

>  Gustavo> +VALA_VERSION = 0.12.1
>
> Nice, any specific reason to not go with 0.14 instead?

Previous versions of gmpc failed to build with the newest.
But the one we've got doesn't so i'll send a bump in a new patchset.
Regards.
