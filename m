From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 Oct 2019 13:38:05 +0200
Subject: [Buildroot] Build failure on upgrade to 2019.08.1
In-Reply-To: <CAJJ6jxvkTS5=9+v7N0BXQD2AWYvp9zEiRyPxtpNBYmjydL5zBw@mail.gmail.com>
References: <CAJJ6jxvGsZ0SYgivex5jGCHg21_acu=kp5CdRO2FF2K_xhUZwQ@mail.gmail.com>
 <fced002e-90cf-30e7-d515-f546daaf77bf@mind.be>
 <CAJJ6jxuRAd76-cOzKgGhtq0nvx+w0MeoMTCKdHzNmsGP+Rudzg@mail.gmail.com>
 <90524ee3-a438-fb38-da43-8632066743af@mind.be>
 <CAJJ6jxvGXS4L0fjp16WHGtdd6fKMhTPcCsS2aeaZPrkW0MBNYw@mail.gmail.com>
 <fbfd215f-42ec-74e8-b1b6-5650624d7ca0@mind.be>
 <CAJJ6jxvkTS5=9+v7N0BXQD2AWYvp9zEiRyPxtpNBYmjydL5zBw@mail.gmail.com>
Message-ID: <d2390d24-80b1-7b88-dec9-08077ed1035d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/10/2019 22:26, Steve Calfee wrote:
[snip]
> Thanks for trying. Here are my two configs:

 Hm, I still couldn't reproduce with those... I used 'make toolchain' for the
toolchain, and 'make dbus for the full build. And of course I removed all the
sheevaplug and dockstar stuff that I don't have...

 Regards,
 Arnout
