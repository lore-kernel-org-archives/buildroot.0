From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Fri, 4 Aug 2017 13:46:34 -0700
Subject: [Buildroot] [PATCH v3] qt5wayland: new package
In-Reply-To: <e5d8c8ca-0aae-0d3d-2c19-3e520318345a@mind.be>
References: <1501535208-8161-1-git-send-email-joshua.henderson@microchip.com>
 <e5d8c8ca-0aae-0d3d-2c19-3e520318345a@mind.be>
Message-ID: <8d12976f-5582-ed70-46f2-c4757a312cc8@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On 08/03/2017 12:06 AM, Arnout Vandecappelle wrote:
> 
> 
> On 31-07-17 23:06, Joshua Henderson wrote:
>> QtWayland is a Qt 5 module that wraps the functionality of Wayland.
>>
>> Cc: Julien Corjon <corjon.j@ecagroup.com>
>> Cc: Brent Sink <brents_3@hotmail.com>
>> Cc: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> 
>  Hi Joshua,
> 
>  I've applied to the next branch, with a few fixes:
> 
>      - select wayland instead of depending on it;
>      - propagate jscore dependency from qt5declarative
>      - re-order select/depends statements
>      - rewrite comment to only refer to GL backend (jscore is an arch
>        dependency)
>      - rewrap help text of BR2_PACKAGE_QT5WAYLAND_COMPOSITOR
> 

Thanks.  I don't see any issues with this.

>  Could you also add yourself to the DEVELOPERS file for this package and others
> you are interested in? Then you will get a mail whenever these packages fail in
> the autobuilders.

Done.  I will add more later.

Josh
