From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 01:26:42 +0100
Subject: [Buildroot] Updating package liblo -> 0.29
In-Reply-To: <CA+bRTvAtkx82JuqFcd4_8G_BggRyvUWQJje0nJ+T7R9uEyxhgg@mail.gmail.com>
References: <CA+bRTvAtkx82JuqFcd4_8G_BggRyvUWQJje0nJ+T7R9uEyxhgg@mail.gmail.com>
Message-ID: <a988ccd9-9dc1-ccef-9574-957c793063ee@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-02-18 01:09, Alex Baldwin wrote:
> Hey Everyone,
> 
> I am new to this list and very new to buildroot. What is the best was to either
> request or submit a version update to a buildroot package. Specifically an
> application I have written heavily relies on the nice cpp wrapper (just a
> header) provided in liblo v0.28+, whereas buildroot is on 0.27.

 Just submit a patch[1] doing the version bump. You will have to modify the
version and update the hash. Also, while you are there, please add a hash for
the license file[2]. Finally, if you are interested in helping maintaining the
package, consider adding yourself to the DEVELOPERS file[3].

 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#submitting-patches
[2] https://buildroot.org/downloads/manual/manual.html#adding-packages-hash
[3] https://buildroot.org/downloads/manual/manual.html#DEVELOPERS

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
