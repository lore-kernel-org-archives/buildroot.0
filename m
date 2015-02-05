From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 5 Feb 2015 11:50:10 +0100
Subject: [Buildroot] Fwd: Problem with rcK script
In-Reply-To: <CAJpGAeEqvTi1EkbGLy-p4PnFwZWR7gZWKmij+fn-sHB8ZvHLpw@mail.gmail.com>
References: <CAJpGAeFjiFn9rw3uj9j1xbA4JqWr4PJ89X9A_7=VKjKYK6Yu8Q@mail.gmail.com>
 <CAJpGAeHWB=+AU9-ZCSpczqsy_06H2x8mp-b7=dvHSsiHZQU7sQ@mail.gmail.com>
 <01A97699-6B5B-436F-907D-F9A1C8F05285@gmail.com>
 <CAJpGAeEqvTi1EkbGLy-p4PnFwZWR7gZWKmij+fn-sHB8ZvHLpw@mail.gmail.com>
Message-ID: <CAAXf6LVOFJ4nRTnc_u9tBr7NdUdf7TEzXMfj2yE1=1YQBcTQRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 5, 2015 at 8:03 AM, hardik gohil <hardikmjobs@gmail.com> wrote:
> Hello,
>
> Thank you for your exact solution.
>
> I am not using any swap memory,is it fine to remove "swapoff -a" from
> inittab ?

If you don't use it it can be removed, but it does not hurt to keep it either.
