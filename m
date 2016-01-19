From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Jan 2016 23:09:39 +0100
Subject: [Buildroot] as: unrecognized option '--64'
In-Reply-To: <CAKradHu116Zh8Rh-iWk9a=UL6SrtBz48-syBD=5uOJaZpWdRTw@mail.gmail.com>
References: <CAKradHu116Zh8Rh-iWk9a=UL6SrtBz48-syBD=5uOJaZpWdRTw@mail.gmail.com>
Message-ID: <569EB423.8010203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-01-16 17:26, Alejandro Blasco wrote:
> Hi, thank you for your work.
> 
> I'm having this problem after configuring and running make, and nobody talk
> about it in forums, stackoverflow, ....
> 
> btw I'm using Fedora 23
> * Attached .config file
> 
> 
> 
> 
> 
> make[2]: Leaving directory
> '/home/alejandro/Desktop/linux/buildroot/output/build/host-gcc-initial-5.2.0/build/fixincludes'
> make[2]: Entering directory
> '/home/alejandro/Desktop/linux/buildroot/output/build/host-gcc-initial-5.2.0/build/gcc'
> /home/alejandro/Desktop/linux/buildroot/output/host/usr/bin/ccache /usr/bin/g++
> -c   -O2 -I/home/alejandro/Desktop/linux/buildroot/output/host/usr/include
> -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti
> -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual
> -Wmissing-format-attribute -Woverloaded-virtual -pedantic -Wno-long-long
> -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -DGENERATOR_FILE
> -I. -Ibuild -I../../gcc -I../../gcc/build
> -I../../gcc/../include  -I../../gcc/../libcpp/include  \
> -DBASEVER="\"5.2.0\"" -DDATESTAMP="\"\"" \
> -DREVISION="\"\"" \
> -DDEVPHASE="\"\"" -DPKGVERSION="\"(Buildroot 2015.11.1) \"" \
> -DBUGURL="\"<http://bugs.buildroot.net/>\"" -o build/version.o
> ../../gcc/version.c
[snip]
> /home/alejandro/Desktop/linux/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/bin/as:
> unrecognized option '--64'

 This is _extremely_ strange. There is no reason at all why the system's g++
should call the cross-as...

 Do you have something particular in your environment?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
