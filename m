From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 10:51:46 -0300
Subject: [Buildroot] polarssl https download cercificate error.
In-Reply-To: <551AA350.1060203@proximus.be>
References: <551A6805.9050003@proximus.be> <551A7D32.7000404@zacarias.com.ar>
 <551AA350.1060203@proximus.be>
Message-ID: <551AA672.4000301@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/31/2015 10:38 AM, Johan Sagaert wrote:

> Dear
> 
> That patch is not solving the problem :
> It still reverts to downloading from buildroot.
> As said before : https://tls.mbed.org/code/releases/polarssl-1.2.13-gpl.tgz
> is  working in the browser but buildroot fails to download the file.

Hi.
That's because the wget version on your distribution is old and doesn't
understand alt names.
We're looking into a better solution, but for the time being using
sources.buildroot.net as a fallback works.
Regards.
