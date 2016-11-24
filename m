From: Christian Stewart <christian@paral.in>
Date: Thu, 24 Nov 2016 14:58:29 -0500
Subject: [Buildroot] Analysis of build results for 2016-11-23
In-Reply-To: <20161124094429.4152c19b@free-electrons.com>
References: <20161124073011.C2C1620BD5@mail.free-electrons.com>
 <20161124094429.4152c19b@free-electrons.com>
Message-ID: <CA+h8R2oJtHMsruLGEyybZgqVxx=YU08R+kKZPXnmcX-UUrN0jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 24, 2016 at 3:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>>       x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/42037d00edf075117f31d5199c77577eb31bc783
>
> I don't see what the error is. Christian, could you try to reproduce
> and investigate?

Very strange, I see no specific errors and I can't reproduce it
locally using the same defconfig. Maybe some kind of build flake? I
looked into error 2 from the go compiler but that seems to be a
generic error code. Do you think it might have run out of memory or
something similar?

I run automated builds of Buildroot as well with similar configs on
resource constrained cloud machines and have not yet run into anything
like this.

Best,
Christian Stewart
