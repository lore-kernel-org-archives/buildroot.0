From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Nov 2010 15:52:28 -0300
Subject: [Buildroot] gpsd building fails while compiling Qt bindings
In-Reply-To: <AANLkTi=aFtH1wFxm8HrRgXh+7Yp7OLTU1UijN_eECqpO@mail.gmail.com>
References: <AANLkTi=aFtH1wFxm8HrRgXh+7Yp7OLTU1UijN_eECqpO@mail.gmail.com>
Message-ID: <4CE1816C.30202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/10 12:45, Frederik Pasch wrote:

> This is caused because configure tries to use the host-qmake.
> 
> The attached patch should solve this issue.
> 
> Maybe building the Qt Bindings should also be a config-parameter...
> 
> Frederik Pasch

Thanks, pushed to my repo for later inclusion.
Added a small fix you missed, when enabling the bindings gpsd needs
host-pkg-config also.
Regards.
