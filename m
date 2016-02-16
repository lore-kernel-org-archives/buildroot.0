From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Tue, 16 Feb 2016 23:56:17 +0100
Subject: [Buildroot] libcapn build failure
In-Reply-To: <20160216233311.2c448df5@free-electrons.com>
References: <56C1F90F.80804@proximus.be>
 <CAHXCMMJf4JHRKoCZ_B9eMWXf+rXX+xNgi=e2Qzm_mJi8ULBRvg@mail.gmail.com>
 <56C3A2B8.5030309@proximus.be> <20160216233311.2c448df5@free-electrons.com>
Message-ID: <56C3A911.7060502@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas

Op 16/02/2016 om 23:33 schreef Thomas Petazzoni:
> Dear Johan Sagaert,
>
> On Tue, 16 Feb 2016 23:29:12 +0100, Johan Sagaert wrote:
>
>> git clonehttps://github.com/adobkin/libcapn.git
>> git submodule update --init      <<<---------- This downloads the jansson source.
> We already have a jansson package in Buildroot, so you should rather
> make your package "select" it, and then tweak your package so that it
> uses the Buildroot-built jansson rather than its own internal copy.
>
> Best regards,
>
> Thomas
I agree,
It is even the same version as in buildroot, and
it would make the submodule downloadunnecessary.

If you could give me some info how i could modify CMakeLists.txt so it
tests for the jansson library and uses that for linking.

Thanks

Johan
