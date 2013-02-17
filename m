From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 17 Feb 2013 15:55:56 -0300
Subject: [Buildroot] bump libnl to 3.2.21 before release
In-Reply-To: <51212637.6020406@siganos.org>
References: <51212637.6020406@siganos.org>
Message-ID: <512127BC.9050004@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/17/2013 03:49 PM, Dimitrios Siganos wrote:
> If you linked against 3.2.18 or 3.2.19 your binary will not be
> compatible with >= 3.2.20. You will have to relink your binary. We are
> sorry for any inconvenience this may cause.
> 
> Note: The API/ABI that is exported as of 3.2.21 is considered 100%
> stable. No more exceptions that cause confusion and breakage. I will no
> longer merge patches that break API/ABI even though the API seems unused
> at this point. Things have been broken too many times.

The keyword here is "binary".
Breaking ABI isn't important in the buildroot context of packages since
you're building from source thus you don't care about ABI.
It's the same boat like when we moved the openssl package from 0.9.8* to
1.0.*
Is there any explicit problem 3.2.18 causes that affects you?
Regards.
