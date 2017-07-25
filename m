From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Jul 2017 22:43:22 -0300
Subject: [Buildroot] [PATCH v3] imx6q-sabresd: Add a qt5 defconfig
	variant
In-Reply-To: <CAOMZO5DTwfOrBy8xDf0Yxg-Rk34-v-vAGaqkoyGUscZ0hiM-5A@mail.gmail.com>
References: <1498078187-32377-1-git-send-email-festevam@gmail.com>
 <CAOMZO5DTwfOrBy8xDf0Yxg-Rk34-v-vAGaqkoyGUscZ0hiM-5A@mail.gmail.com>
Message-ID: <CAOMZO5A6z+0D9zRrSfH6eYC2oDEC_1c5oeETBSsWTRU=v5QzPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 11, 2017 at 10:44 AM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Thomas,
>
> On Wed, Jun 21, 2017 at 5:49 PM, Fabio Estevam <festevam@gmail.com> wrote:
>> Introduce imx6q-sabresd_qt5_defconfig that supports the opensource
>> Etnaviv graphical stack.
>>
>> This defconfig provides a way to quickly test some graphical applications,
>> such as kmscube, qt5, glmark2.
>>
>> Currently kernel mainline exhibits issues when running cpufreq as ondemand
>> governor on mx6, so add a linux fragment that disables such option for the
>> time being.
>>
>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>> ---
>> Changes since v2:
>> - Drop BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST (Thomas)
>> - Bump to the latest kernel 4.11.6
>
> Any feedback, please?

Ping, I have been trying to submit this patch for months, but no
progress so far.
