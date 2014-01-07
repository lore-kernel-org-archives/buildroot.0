From: Bryce Schober <bryce.schober@gmail.com>
Date: Tue, 7 Jan 2014 12:43:41 -0800
Subject: [Buildroot] Why is sysroot under i686-buildroot-linux-gnu?
In-Reply-To: <20140107144553.15c189a4@skate>
References: <CAJpxd07vs10v6uhOe3=_a=Rj-40x+Q8yWh0cK+YbTnP1HdzLTw@mail.gmail.com>
 <20140104222832.7a8dab5b@skate>
 <CAJpxd06=L5uMVHm2ZH2u5iRvB1CbRYQiJcaNfEheeNk-pqWc+w@mail.gmail.com>
 <20140107144553.15c189a4@skate>
Message-ID: <CAJpxd048a0Yw7HhO3kh5Sc7opQPiOncNzUhgSLR3JuEXgvOiuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 6, 2014 at 10:45 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Ok, I think I see what you mean. Can you test the following patch and
> see if it fixes the problem for you?
>

I don't see how it could, at least not as I was thinking, since
STAGING_SUBDIR still uses $(GNU_TARGET_NAME)...

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140107/1a7e98e8/attachment-0001.html>
