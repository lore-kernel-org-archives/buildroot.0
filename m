From: Michael Walle <michael@walle.cc>
Date: Thu, 07 Nov 2019 23:44:12 +0100
Subject: [Buildroot] [PATCH v2] boot/uboot: add initial environment
 support
In-Reply-To: <20191027203838.014123d1@windsurf.dhcp.lyon.intranet>
References: <20190527192342.23406-1-michael@walle.cc>
 <20191027203838.014123d1@windsurf.dhcp.lyon.intranet>
Message-ID: <5d0ac8b1bd989df1817afcd62ce2f67c@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am 2019-10-27 20:38, schrieb Thomas Petazzoni:
>> Since v2019.07 U-Boot supports extracting the compiled-in environment.
>> As a first step, add support to the environment generation in 
>> buildroot.
>> In the future, the text file may also be copied into the target
>> filesystem, where it will be used by the uboot-tools.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
> 
> This feature was in the mean time added in uboot.mk, in a slightly
> different form, but it does the same thing.
> 
> See:
> 
> 
> https://git.buildroot.org/buildroot/commit/?id=2c8ff251cb16d38fb417a488ee0367cd03eebda2
> 
> Could you check if it works for you as well?

Yes that works too. We're actually already using it.

-michael
