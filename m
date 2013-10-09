From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Oct 2013 18:46:29 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <525556CE.3000308@lucaceresoli.net>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <CAAXf6LVxoXMaBFVzc6Hd46ST8AwDOyd8PdRfJ04WKfF9po_K9w@mail.gmail.com>
 <525556CE.3000308@lucaceresoli.net>
Message-ID: <52558865.8070804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 15:14, Luca Ceresoli wrote:
>> Related to this is the question of a license URL. I personally think
>> it is not legally safe to only refer to a URL from a package, because
>> who knows someone changes the license text on the URL. They could just
>> alter the license of existing sources.
>> So although the feature of automatically downloading a license text
>> from its URL looks nice, I (not a lawyer) would not recommend
>> implementing it. I follow ThomasP's reasoning of requesting upstream
>> to add the effective license text to the sources, and in the meantime
>> using the magic value decided above for case (b).
>
> I agree with you. Regarding the legal stuff we should stay on the safe
> side. But Arnout and Simon expressed an opposite opinion on another
> branch of this thread...

  If the package specifies that the license is available at a specific 
URL, then that is the license, right? It is true that the license may 
change unexpectedly, but to make sure it stays consistent we should 
download the license at the same time that the source is downloaded 
(which could be tricky, I admit).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
