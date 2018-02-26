From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 26 Feb 2018 08:44:51 -0500
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <CAJtjsKYkA53_yxOmB4jxy1Kc=iWEWrKYyz2GLKTKhSs7UMGCZw@mail.gmail.com>
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
 <CAJtjsKYkA53_yxOmB4jxy1Kc=iWEWrKYyz2GLKTKhSs7UMGCZw@mail.gmail.com>
Message-ID: <CA+-urNS7M41PJQh-W1rYcpgzbWjz3F6NJC=32ormFgvY0LNKdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan and Thomas,

On Mon, Feb 26, 2018 at 5:51 AM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> Hi Thomas, All,
>
> On Mon, Feb 26, 2018 at 11:33 AM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> Hello,
>>
>> We're almost at the end of the month, and therefore almost at the
>> final 2018.02, which will be a LTS. I believe it is a good opportunity
>> to make a final effort to resolve the remaining build failures. See
>> below for an analysis.
>>
>> Romain, Johan, Frank, Eric, Mahyar, Bernd, Guillermo, Pierre, Waldemar,
>> there are questions for you below. Thanks!
>>
>> On Mon, 26 Feb 2018 08:00:10 +0100 (CET), Thomas Petazzoni wrote:
>>
>>>      powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/45edf95c0c44c9d553879e0cbb771098d7c63aa1 |
>>>          arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/a36d00407a371d70b4551a9717ebd6ff852c8bca |
>>
>> I propose that we make erlang depend on x86/x86_64 as host
>> architecture. Johan, Frank, are you OK ?
>
> Yes, I agree with making host-erlang depends on x86/x86_64
> architectures. I never compile it from another architecture anyway. I
> looked at existing patches to such errors, but find nothing that make
> Erlang successfully compiled from a powerpc or an arm host.

I agree with this solution as well. I'm not aware of anyone using
host-erlang on anything but x86_64.

-Frank


> What is the exact option to add to Config.in to achieve this?
> Do you want me to submit a patch or you do it?
>
> Best,
> --
> Johan
