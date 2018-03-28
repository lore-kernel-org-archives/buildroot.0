From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Wed, 28 Mar 2018 11:07:47 +0200
Subject: [Buildroot] [PATCH v4 2/8] gst-plugins-${base, good, bad,
 ugly}: bump to 1.14.0
In-Reply-To: <20180322235537.261ea603@gmx.net>
References: <20180322173220.31791-1-aduskett@gmail.com>
 <20180322173220.31791-2-aduskett@gmail.com> <20180322235537.261ea603@gmx.net>
Message-ID: <0793a477-e255-caf8-2675-9728534b5e2e@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-03-22 23:55, Peter Seiderer wrote:
> Hello Adam,
> 
> On Thu, 22 Mar 2018 13:32:14 -0400, Adam Duskett <aduskett@gmail.com> wrote:
> 
>> These are grouped together because several plugins have been re-arranged and
>> there is no way to individually update each plugin package.
>>
>> Changes:
>>
>> Add the following to gst1-plugins-base and remove them from plugins-bad:
>>  - opengl
>>  - gles2
>>  - glx
>>  - egl
>>  - x11
>>  - wayland
> 
> This still contradicts your own statement [1]:
> 
>   Not entirely! There is --enable-wayland now in both base AND bad!
> 

Adam,

Could you have a look at this once more? How would the correct bump look
like (just to understand this)?

thanks a lot!

                               martin
