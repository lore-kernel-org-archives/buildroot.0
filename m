From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 15 Oct 2012 17:27:45 -0300
Subject: [Buildroot] Git download is currently broken
In-Reply-To: <507C5D81.7060109@mind.be>
References: <CAExDhvZGg+VBSx3aP73yG8er9ppqEfL4FrmcoQbn4OT5xcVi8A@mail.gmail.com>
 <507C5D81.7060109@mind.be>
Message-ID: <CAExDhvY1j1ifA7OP3+Qc14qbWLc9+_hUZLCvZLvt5Ypp1nMvHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Oct 15, 2012 at 4:01 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 15/10/12 19:49, Thiago A. Corr?a wrote:
>>
>> Hi,
>>
>>       I've noticed that the generic-package Git download method is
>> broken, but I haven't been able to figure out why. Even packages
>> already included in buildroot will download from the buildroot.net
>> mirror instead of git.
>
>
>  Works for me (tried with can-utils).
>
>  Can you run buildroot with 'make V=1' to see how git is called?  The
> output is very difficult to parse, but somewhere in that huge shell line
> there should be something like:
>

Ah, I see the problem now. My configuration for git command had "git
clone" when it should be just git. Thanks for the hint :)

Kind Regards,
     Thiago A. Correa
