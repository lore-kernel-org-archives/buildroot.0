From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 15 Sep 2015 11:14:48 +1200
Subject: [Buildroot] [PATCH] micropython: new package
In-Reply-To: <55F6C649.60700@imgtec.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
 <55F6C649.60700@imgtec.com>
Message-ID: <CAFOYHZD67xLw=Mrpbi0QbCr_0WuGqYJgyCv4f+hR04+RGLLDsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Tue, Sep 15, 2015 at 1:06 AM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> On 09/14/2015 11:21 AM, Chris Packham wrote:
<snip>
>> +ifeq ($(BR2_powerpc),y)
>> +MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
>> +endif
>
> A comment about why this is necessary for powerpc would be good, IMHO.
>

Full explanation is here
https://github.com/micropython/micropython#the-unix-version I'll try
to include a short comment in the makefile.
