From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 5 May 2014 10:00:03 +0200
Subject: [Buildroot] Patchwork big patchsets: SELinux
In-Reply-To: <OFC7852024.A07AA540-ON86257CCC.005740FD-86257CCC.00574102@rockwellcollins.com>
References: <CAAXf6LW8iN=SskGU6x7XkjfVR4NQR-JzE2sNRjYtehHnpu391Q@mail.gmail.com>
 <OFC7852024.A07AA540-ON86257CCC.005740FD-86257CCC.00574102@rockwellcollins.com>
Message-ID: <CAAXf6LUCXuvR1DqHuxpORU_LjKzbZ6Kcc1fNZgcGsNb=AX0hHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Clayton,

On Fri, May 2, 2014 at 5:53 PM,  <clshotwe@rockwellcollins.com> wrote:
[..]
>>I would like to check on the state of one of the big patchsets in
>>patchwork: the SELinux patches posted by Clayton Shotwell.
>>
>>The last iteration in patchwork is v5, posted in December 2013.
>>
>>What I would like to know specifically is:
>>- what is the state of the patchset?
> I have not had any time to touch it since they were last submitted. I probably wont be able to get to them late next month at the earliest. I know all of those packages have had at lease two releases since I submitted the patches so the new versions need to be reintegrated.
>
>>- what is blocking integration of this patchset?
> I think mainly review time. The audit package required a large patch to get it to cross compile correctly. That one especially needs to be looked at it again.
>
>>- what can be done to deblock it?
> Me finding free time to revamp the packages. :)
>


Thanks for the feedback.
In the mean time, I'll remove the patches from patchwork then.

Best regards,
Thomas
