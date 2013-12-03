From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 3 Dec 2013 14:46:22 +0100
Subject: [Buildroot] [PATCH] smbnetfs: new package 0.5.3a
In-Reply-To: <20131203144104.76555c52@skate>
References: <20131202230903.GA3906@gmail.com> <20131203094701.08480f23@skate>
 <20131203133043.GA6637@gmail.com> <20131203144104.76555c52@skate>
Message-ID: <CAAXf6LUMuBePyRR4ghAWFfzvQvtbzQXyq1o=JQQyDg-NyQfRWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Dec 3, 2013 at 2:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
>> > I'm not sure here if we want to depend on Samba, or select Samba.
>> > Usually, we prefer "select" so that things are transparent for the
>> > user. However, when the thing being selected is "big", and fairly
>> > obvious for the user (like the Python interpreter being needed to
>> > build a Python module), we use depends on. I'm not sure which
>> > choice to make here.
>>
>> Yes, I had made the decision that samba was "intrusive" enough to
>> require explicit selection.  I figured since it required something
>> outside of the Libraries section, I would make the user explicitely
>> add it.
>
> I'm fine with this choice. We'll see what the other Buildroot
> developers think about this.
>

I'm fine with either choice. However, if a 'depends on' is chosen, I
don't think there should be a comment about it. We typically only add
comments for toolchain dependencies.

Best regards,
Thomas
