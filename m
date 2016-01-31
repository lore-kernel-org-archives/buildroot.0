From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 31 Jan 2016 21:08:03 +0100
Subject: [Buildroot] [git commit] flot: add hash file
In-Reply-To: <20160131104313.1c5fdd0a@free-electrons.com>
References: <20150728204046.4BDD17F9DF@busybox.osuosl.org>
 <rs5uncx00j.ln2@ID-313208.user.individual.net>
 <20160131104313.1c5fdd0a@free-electrons.com>
Message-ID: <56AE69A3.3050807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 10:43, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 30 Jan 2016 08:38:35 +0100, Bernd Kuhls wrote:
> 
>> I downloaded the tarball
>> http://www.flotcharts.org/downloads/flot-0.8.3.tar.gz
>> today and got a different sha256 checksum:
>>
>> ERROR: flot-0.8.3.tar.gz has wrong sha256 hash:
>> ERROR: expected: 
>> d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952
>> ERROR: got     : 
>> ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21
>> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> I checked locally, and in my BR2_DL_DIR, I still have a tarball that
> has the
> d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952 hash,
> but indeed if I re-download it, I get a tarball with the
> ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21 hash.
> 
>> Shall I send a patch?
> 
> Yes, please do. It would also be great to notify upstream that they
> shouldn't change their tarballs.

 Perhaps we should first check what is different?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
