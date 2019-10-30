From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 30 Oct 2019 13:48:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/rauc: bump to v1.2
In-Reply-To: <e5f99201-9f28-1e02-a3de-d87460ae1ad6@koncepto.io>
References: <20191029174122.97086-1-titouan.christophe@railnova.eu>
 <e5f99201-9f28-1e02-a3de-d87460ae1ad6@koncepto.io>
Message-ID: <6b3946ae-c622-7bdc-f133-4f93f2856399@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pierre-Jean,

On 10/29/19 6:56 PM, Pierre-Jean Texier wrote:
> Hi Titouan,
> 
> Le 29/10/2019 ? 18:41, Titouan Christophe a ?crit?:
>> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
>> ---
>> ? package/rauc/rauc.hash | 4 ++--
>> ? package/rauc/rauc.mk?? | 2 +-
>> ? 2 files changed, 3 insertions(+), 3 deletions(-)

[snip]

> 
> Since commit in [1], we need to add dbus in
> RAUC_DEPENDENCIES, otherwise the build fails
> with the following issue:
> 
> checking for Valgrind tool drd... drd
> checking for Valgrind tool exp-sgcheck... exp-sgcheck
> checking pkg-config is at least version 0.9.0... yes
> checking for DBUS1... no
> configure: error: Package requirements (dbus-1) were not met:
> Package 'dbus-1', required by 'virtual:world', not found
> 


Indeed, I resent an updated version. Thanks for your review !

> This issue was found with 'test-pkg'.
> 
> Thanks !
> 
> Pierre-Jean
> 
> [1] - 
> https://github.com/rauc/rauc/commit/7698cadcbbd0db63877a2947b1d6b9cc7b556f58 
> 

Titouan
