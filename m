From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Sep 2014 12:00:57 +0200
Subject: [Buildroot] [PATCH v2] Add support for Flattened Image Trees
In-Reply-To: <CAAXf6LXQ+jsBRG=xGAmhcydPotvb62Pw337NJaX-yitJ0VNa0Q@mail.gmail.com>
References: <1410981210-7788-1-git-send-email-yegorslists@googlemail.com>
 <c3bf0f66-d29d-4a77-930d-c33ac938368c@email.android.com>
 <CAGm1_ks=xwD4pm9aFF9AfKsFDeOhLPthkdx6BbLwY71z1e8TXg@mail.gmail.com>
 <CAAXf6LXtSvZQoJc0qibQhdCvS3XEECgMShr1tncrKduhTAsJGQ@mail.gmail.com>
 <CAGm1_ktxYNG99Vq+=tyhFyQqYuVE2==-psqRPh1Dp7H2aUgMJQ@mail.gmail.com>
 <81266ccf-e3d8-470e-9c94-4a63931a4fa2@email.android.com>
 <CAGm1_kvvNMcCgpZvS+YOxrnsQNHtCxt8Wd_0kprvTMS0zYXJFg@mail.gmail.com>
 <216395b4-20a8-400c-be86-87ec3f22ae14@email.android.com>
 <CAGm1_kuD=T4XoiEZG=yKDNq_FfoWkXe3k4da0=OVcpC3KbifYA@mail.gmail.com>
 <CAAXf6LXQ+jsBRG=xGAmhcydPotvb62Pw337NJaX-yitJ0VNa0Q@mail.gmail.com>
Message-ID: <20140919120057.06ef721b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 19 Sep 2014 11:19:28 +0200, Thomas De Schampheleire wrote:

> Regarding the implementation: I think it'd be more clear to calculate
> the final ITS and ITB values (so after qstrip, basename,  etc.) in a
> separate variable, so that the commands are easy to read and there is
> less duplication.

I think that's exactly what I did in the prototype code I sent to
Yegor, but apparently, he didn't use it...

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
