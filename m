From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jun 2008 17:01:35 +0200
Subject: [Buildroot] cris
In-Reply-To: <485FB911.7010708@cetrtapot.si>
References: <20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAFF8.8090604@cetrtapot.si>
	<20080620141152.GG12682@mx.loc> <485F507D.5070801@cetrtapot.si>
	<20080623130323.GB8920@mx.loc> <485FB61C.7080403@cetrtapot.si>
	<20080623144641.GA9282@mx.loc> <485FB911.7010708@cetrtapot.si>
Message-ID: <20080623150135.GB9282@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 23, 2008 at 04:54:09PM +0200, Hinko Kocevar wrote:
>Bernhard Fischer wrote:
>> On Mon, Jun 23, 2008 at 04:41:32PM +0200, Hinko Kocevar wrote:

>>> I think it is the correct path to take, but will still try to work out the best solution with the Axis devs later on..
>> 
>> If cris does that then the other archprepare arches still need handling,
>> so this is not a complete fix but purely cris-specific.
>
>It is cris specific, I was not aware of the problem existing on other architectures.
>
>I think that other arches are not affected as long as the whole need for headers goes (haven't really tried out). It is kernel bug in cris port that can't handle the headers for arch-v10 and arch-v32 correctly. So once the Axis has complete solution in order to pull all required headers from the source tree this problems will vanish.

Maybe there was an additional glitch with cris, but the fundamental
shortcoming remains and needs to be fixed/improved in a general way.

Note that this particular cris glitch (missing sub-arch specific
headers) would not have been really visible if the above would be done
properly.
