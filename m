From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Mar 2012 16:27:56 -0300
Subject: [Buildroot] [PATCH] qemu/microblazebe-mmu: add new sample config
In-Reply-To: <4F6A16F0.9090304@relinux.de>
References: <1332192059-19769-1-git-send-email-gustavo@zacarias.com.ar>
 <4F6A16F0.9090304@relinux.de>
Message-ID: <ee94639023cc1057e5a502a78ad8910f@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-21 14:59, Stephan Hoffmann wrote:

> That'd great. I did not get it running some months before, most 
> likely
> because I tried little endian:-)
>
> Stephan

I've sent both already.
The test rig seems a bit flaky with OpenSSL, i don't know if it due to 
Qemu doing something wrong, the toolchain being flaky or OpenSSL doing 
something bad.
It can usually be trigger by running "openssl speed -evp aes256" for 
example, sometimes it'll finish the tests, and sometimes it'll segfault 
in between.
Happens for both BE and EL.
Regards.
