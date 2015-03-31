From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Tue, 31 Mar 2015 15:38:24 +0200
Subject: [Buildroot] polarssl https download cercificate error.
In-Reply-To: <551A7D32.7000404@zacarias.com.ar>
References: <551A6805.9050003@proximus.be> <551A7D32.7000404@zacarias.com.ar>
Message-ID: <551AA350.1060203@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo Zacarias schreef op 31/03/2015 om 12:55:
> On 03/31/2015 06:25 AM, Johan Sagaert wrote:
>
>> Hi
>>
>> The link https://tls.mbed.org/download/polarssl-1.2.13-gpl.tgz seems to
>> be OK when
>> opening this from a browser.
>> Why is the download complaining ?
> Hi.
> That's because they were bought by ARM and got renamed to mbed tls.
> I'll send a patch to update the URL.
> Regards.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
Dear

That patch is not solving the problem :
It still reverts to downloading from buildroot.
As said before : https://tls.mbed.org/code/releases/polarssl-1.2.13-gpl.tgz
is  working in the browser but buildroot fails to download the file.

Regards , Johan

 >> polarssl 1.2.13 Downloading
--2015-03-31 15:29:05-- 
https://tls.mbed.org/code/releases/polarssl-1.2.13-gpl.tgz
Resolving tls.mbed.org... 79.170.91.36
Connecting to tls.mbed.org|79.170.91.36|:443... connected.
ERROR: certificate common name ?polarssl.org? doesn?t match requested 
host name ?tls.mbed.org?.
To connect to tls.mbed.org insecurely, use ?--no-check-certificate?.
--2015-03-31 15:29:06-- http://sources.buildroot.net/polarssl-1.2.13-gpl.tgz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1023128 (999K) [application/x-gzip]
