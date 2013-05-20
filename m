From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 20 May 2013 14:08:58 +0100
Subject: [Buildroot] [PATCH] ed: Fix quiet building
In-Reply-To: <20130520144725.2f57a5de@skate>
References: <1369053745-25578-1-git-send-email-markos.chandras@gmail.com>
 <20130520144725.2f57a5de@skate>
Message-ID: <CAG2jQ8gKt7QdU4PLMi0DA5BQOY7=qS8vepYQopL-tFj0rxwmHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 May 2013 13:47, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Mon, 20 May 2013 13:42:25 +0100, Markos Chandras wrote:
>
>> The configure script is a custom one, and '-q' is not supported.
>> It fixes the following problem when building using 'make -s'
>>
>> configure: Unrecognized option: "-q"; use --help for usage.
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>
> If the configure script is not an autotools one, then we shouldn't be
> using the autotools-package infrastructure for this package.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Hi Thomas,

No problem. I will convert it and send a new patch.

--
Regards,
Markos Chandras
