From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Jun 2016 10:20:09 -0300
Subject: [Buildroot] [PATCH 010/121] package/gstreamer1: add hash file
In-Reply-To: <87vb140zk3.fsf@dell.be.48ers.dk>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <4d192a07160d9c41e9abe7e1aaa73a6f7f28c435.1466334225.git.yann.morin.1998@free.fr>
 <87y4612d65.fsf@dell.be.48ers.dk> <5767E69A.4030606@zacarias.com.ar>
 <87vb140zk3.fsf@dell.be.48ers.dk>
Message-ID: <5767ED89.6090907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/16 10:17, Peter Korsgaard wrote:

> Heh, you are naturally right. I missed that in the pile of commits
> (the upstream hash was md5 for gstreamer 0.10x) - I'll revert.

Hi.
Yes, i was like "WTF?" seeing a locally computed sha256 was on top of a 
mailing list sha256 which is naturally better :)

> There has been a desire to add hashes for all packages for some
> time. Recently there apparently was some temporary hickup at github,
> which made it painfully clear that we aren't there yet and that was
> (IMHO) a good motivation to work on it.
>
> The Github issue was fixed quite fast upstream (a few hours). I haven't
> contacted Github to hear what went wrong (and not seen any official
> statement), but nevertheless, adding hashes is a good thing to me.

Long overdue, this is always cool (not github failing, rather adding the 
hashes).
Regards.
