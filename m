From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jun 2018 13:33:44 +0200
Subject: [Buildroot] sun8i-h3: sunxi-mali-mainline package with
 linux-next
In-Reply-To: <ac701773-49ba-2022-3c85-29525c8f384e@micronovasrl.com> (Giulio
 Benetti's message of "Fri, 22 Jun 2018 12:28:30 +0200")
References: <CAMty3ZDZucZpr-4M=CCc9nLM=XTKGr5qySDe4Zq5O7t_xov+Jg@mail.gmail.com>
 <ac701773-49ba-2022-3c85-29525c8f384e@micronovasrl.com>
Message-ID: <8736xfkqcn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

Hi,
 >> [   43.666449] Mali device driver loaded

 > IMHO this is very specific to driver more than buildroot package and
 > I suggest you to open an issue on https://github.com/mripard/sunxi-mali
 > So everything dealing with driver is treated there and maybe it's a
 > better place to find help and keep trace for the others
 > (hope it's the right way, this is my first package maintained in
 > Buildroot, so I don't know if I'm doing good, please let me know
 > Peter, Maxime, Thomas and others, thanks).

Yes, I agree. The sunxi-mali project is the best place to discuss these
things if they are not directly related to the Buildroot packaging. If a
fix is found, then the version in Buildroot should naturally be bumped.

-- 
Bye, Peter Korsgaard
