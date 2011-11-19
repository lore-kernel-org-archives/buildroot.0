From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 19 Nov 2011 10:26:17 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <201111181927.41880.arnout@mind.be>
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 <201111172123.05834.arnout@mind.be> <20111117224211.0e793a0b@skate>
 <201111181927.41880.arnout@mind.be>
Message-ID: <CAEYzJUEmGkit9PXw-Ek-f871U0d54A+uV0Ohv6N8DnMvjP6oMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 November 2011 20:27, Arnout Vandecappelle <arnout@mind.be> wrote:
> ?With the commit ID, it is still pretty difficult to find out if a partical release contains it.

git describe --contains <commit-id>

I just learned it! :-)
