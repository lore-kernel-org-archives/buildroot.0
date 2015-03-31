From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 07:55:46 -0300
Subject: [Buildroot] polarssl https download cercificate error.
In-Reply-To: <551A6805.9050003@proximus.be>
References: <551A6805.9050003@proximus.be>
Message-ID: <551A7D32.7000404@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/31/2015 06:25 AM, Johan Sagaert wrote:

> Hi
> 
> The link https://tls.mbed.org/download/polarssl-1.2.13-gpl.tgz seems to
> be OK when
> opening this from a browser.
> Why is the download complaining ?

Hi.
That's because they were bought by ARM and got renamed to mbed tls.
I'll send a patch to update the URL.
Regards.
