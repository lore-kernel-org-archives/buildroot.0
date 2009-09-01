From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 1 Sep 2009 03:36:15 -0300
Subject: [Buildroot] [git commit master] u-boot: mark old 2008.10
	version as deprecated
In-Reply-To: <20090831072850.3018cb78@hcegtvedt.norway.atmel.com>
References: <20090827124024.6B23277691@busybox.osuosl.org>
	<d6cda7730908271838qc80efdfj259e9bf1609f396e@mail.gmail.com>
	<20090828072354.38044247@hcegtvedt.norway.atmel.com>
	<87ljl4dndf.fsf@macbook.be.48ers.dk>
	<20090831072850.3018cb78@hcegtvedt.norway.atmel.com>
Message-ID: <d6cda7730908312336u4d2945f2oa06272c62754f328@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Aug 31, 2009 at 2:28 AM, Hans-Christian
Egtvedt<hans-christian.egtvedt@atmel.com> wrote:
>> ?U-Boot> saveenv
>> ?Hans-Christian> Saving Environment to Flash...
>> ?Hans-Christian> Error: start and/or end address not on sector boundary
>>
>> So noone has used u-boot on avr32 with flash since ~1 year? Strange.
>>
>
> None has used U-Boot + AVR32 + CFI driver.
>

I am, but I'm using your tripple revert patch + my own changes to the
NGW100 code to support my own board with AT49BV640D.

Kind Regards,
   Thiago A. Correa
