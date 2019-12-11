From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 11 Dec 2019 11:29:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/avro: new package
In-Reply-To: <CAKcgs2zA9NHEePquvM7FVoOn38f46d4YCPbhM8xzsG6m_xsCSw@mail.gmail.com>
References: <20191208202503.220908-1-titouan.christophe@railnova.eu>
 <CAKcgs2zA9NHEePquvM7FVoOn38f46d4YCPbhM8xzsG6m_xsCSw@mail.gmail.com>
Message-ID: <51da0c00-7d19-f466-dc13-f11aa6e19e6f@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gilles and all,

On 12/10/19 8:46 PM, Gilles Talis wrote:
> Hello Christophe,
> 
> Thanks for your contribution
> 
> I would be very interested to have other people's opinion on this one,
> but I think it'd be neater to follow the protobuf "architecture":
> - one package for protobuf
> - one package for python-protobuf
> 
> Similarly, you could create:
> - one package for avro-c
> - one package for python-avro
> (another package for avro-cpp eventually

Because I used the single archive (see your next remark below), I draw 
inspiration from the alsa-lib package, which provides both the C lib and 
a python package.

> 
> Moreover, these packages seem to have been nicely separated upstream:
> - avro-c: https://www-eu.apache.org/dist/avro/avro-1.9.1/c/avro-c-1.9.1.tar.gz
> - avro-python3:
> https://www-eu.apache.org/dist/avro/avro-1.9.1/py3/avro-python3-1.9.1.tar.gz
> 

Shame on me, I did not even notice that these nicely separated archives 
were distributed upstream. I'll change that and send a new version.

Using these separated archives would therefore make much more sense in 
their respective "sections" (python-avro, etc...)

> I have not run an exact diff between the avro-src-xxx.tar.gz and the
> other source packages, but if they match, I would recommend using the
> "protobuf" method.
> 
> Thanks
> Gilles.
> 

Thanks for your review !

Titouan
