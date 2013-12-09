From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 9 Dec 2013 07:15:54 -0500
Subject: [Buildroot] [PATCH 1/2] qemu-system: new host package
In-Reply-To: <52A1F432.3010904@mind.be>
References: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>
 <1386117649-7119-2-git-send-email-gustavo@zacarias.com.ar>
 <20131204094419.6d4d4279@skate> <529EFEBA.8040103@zacarias.com.ar>
 <20131204133306.7e7e8e07@skate> <529F24A4.6030005@zacarias.com.ar>
 <52A0BCBC.5000008@mind.be> <20131205233131.0cad979d@skate>
 <CA+-urNQEcvSey5BhuK0dJhGe07YWk65pmq2Ar4212UMq=ockdQ@mail.gmail.com>
 <52A1F432.3010904@mind.be>
Message-ID: <CA+-urNRVOA7RezUW5JO-xCUCoPAjsJJVv+KWHrVs7_TAa6OUyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, Dec 6, 2013 at 10:58 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/12/13 02:14, Frank Hunleth wrote:
>> I care a little (for as much as that counts), but not enough to argue
>> for keeping it if it is becoming a pain. We use qemu-user in a
>> post-build step to run a battery of regression tests on algorithmic
>> code. It has been convenient since the regression test data is too
>> large to run in one pass on the target hardware. It's also faster to
>> run on our PCs. I don't think that the regression tests exercise any
>> of the issues above.
>
>
>  That seems to me like a valuable use case. But you would need a
> Config.in.host for it so it actually becomes visible, right? Care to
> contribute that?

You're right. I had completely forgotten that I had made that change
for that project. I'll submit the patch that I'm using shortly.

Also, I'll need some help on any caveats that are desired. I see the
caveat in cpanminus, but submitting a patch that depends on BR2_BROKEN
feels wrong.

Frank
