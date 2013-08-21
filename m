From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Wed, 21 Aug 2013 10:30:21 -0300
Subject: [Buildroot] [PATCH 1/2] nios2: Add new architecture
In-Reply-To: <52145A9C.9040902@mind.be>
References: <1376999946-3314-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <52145A9C.9040902@mind.be>
Message-ID: <CAAEAJfA5m8b-xkRbzfw-Ukft2bxj0HD51BUZXKEg0Pi6yiUabg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 August 2013 03:13, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/20/13 13:59, Ezequiel Garcia wrote:
>>
>> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>
>> This commit adds very basic support to build for the Nios II
>> architecture. Toolchain support is still missing and instead
>> we need to use an external custom toolchain.
>
>
>  Then you probably want to exclude it from the buildroot toolchain.
>

Ok, I'll take a look.

I want to support buildroot toolchain, but I'm not sure when I'll be able
to do that.

Thanks,
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
