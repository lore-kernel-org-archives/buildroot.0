From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 Mar 2012 09:42:52 -0300
Subject: [Buildroot]
 =?utf-8?q?=5Bgit_commit=5D_libupnp=3A_move_to_version?=
 =?utf-8?q?_1=2E6=2E14_Not_OK_=3A_what_about_1=2E8=2Ex_=3F?=
In-Reply-To: <36443DEF86594D9B9A729F56B7FA7973@JohanW7>
References: <20120321130510.D12F095418@busybox.osuosl.org>
 <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
 <9b5ef20685570e5b23f65a27d03a9afb@zacarias.com.ar>
 <3A0E0C9320F449BC8EB3C0BC9A1CEF40@JohanW7>
 <6cbdb6e08635a9c3e9b273a7a95a2a56@zacarias.com.ar>
 <36443DEF86594D9B9A729F56B7FA7973@JohanW7>
Message-ID: <0180fc4aa250d447b1da60b4cecb5d88@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-23 09:38, Sagaert Johan wrote:

> Hi Gustavo
>
> I have built the 1.8 branch from debian i rebuild my app and it still 
> works.
> The 1.6.14 rease however breaks my app.
>
> UpnpRegisterRootDevice,and UpnpRegisterRootDevice2 (using URL) both
> return UPNP_E_BAD_HTTPMSG.
>
> The upnp httpparser seems to disagree on the http headers sent by
> httpd (busybox 1.19.4).
> (parser_append returns PARSE_FAILURE.)
> I did not test another http server.
>
> So i stay with the debian release (1.8.x).
>
> Johan

Hi Johan.
Just tested 1.6.16 and it's not playing too well with ushare either.
Can you send your package for Debian's 1.8.x so i can test it?
I'd rather avoid a fork (which it probably is) but it seems original 
upstream isn't working that great even though it's still doing new 
releases.
Regards.
