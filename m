From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 28 Jan 2013 17:09:11 +0100
Subject: [Buildroot] post-build script is called before rootfs tweaking
In-Reply-To: <50FAE5CE.5020004@relinux.de>
References: <50FAD374.9010306@relinux.de> <871udhghmr.fsf@dell.be.48ers.dk>
 <50FAE5CE.5020004@relinux.de>
Message-ID: <5106A2A7.7060201@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 19.01.2013 19:28, schrieb Stephan Hoffmann:
> Am 19.01.2013 19:19, schrieb Peter Korsgaard:
>>>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:
>>  Stephan> Hello,
>>  Stephan> buildroot's documentation says:
>>  >> In the Buildroot configuration, you can specify the path to a
>>  >> *post-build script*, that gets called /after/ Buildroot builds all the
>>  >> selected software, but /before/ the rootfs packages are assembled.
>>  Stephan> I understand this the way that the post-build script is called as the
>>  Stephan> last action before package assembly.
>>
>>  Stephan> Is this a bug or a feature? I'd prefer having the script
>>  Stephan> called after the target directory is completely set up.
>>
>> I would call it a bug. I recently fixed up a similar issue with the
>> passwd handling happening after the post-build script.
>>
>> Care to send a patch to fix it?
> I can try, but at the moment I am too busy. Maybe somewhere next week.
This seems to be fixed in the meantime. I had this problem a
distribution based on 2012.08.

Sorry, I should have tried with the latest version before bothering the
list.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
