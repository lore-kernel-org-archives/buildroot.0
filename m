From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:34:53 +0200
Subject: [Buildroot] [PATCH v8 09/12] e2fsprogs: disable unneeded
 features for host
In-Reply-To: <20170422150359.01e5a39b@free-electrons.com>
References: <20170422115955.22718-1-arnout@mind.be>
 <20170422115955.22718-10-arnout@mind.be>
 <20170422150359.01e5a39b@free-electrons.com>
Message-ID: <42f068f3-aac4-8e07-c8bc-5c6526ea3423@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-04-17 15:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 22 Apr 2017 13:59:52 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> From: Carlos Santos <casantos@datacom.ind.br>
>>
>> We don't need e2initrd_helper or the test I/O manager for the host, just
>> like we don't need it for the target.
>>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> [Arnout: don't add --disable-rpath, since we *do* need rpath for the
>>  target; otherwise we have to explicitly pass LD_LIBRARY_PATH to be
> 
> I guess you meant "we *do* need rpath for the host", right ?

 Yes, for host, obviously...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
