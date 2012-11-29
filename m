From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Nov 2012 19:08:13 +0100
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <201211300652.45293.manningc2@actrix.gen.nz>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <201211291121.46456.manningc2@actrix.gen.nz>
 <50B72AAB.2020402@mind.be>
 <201211300652.45293.manningc2@actrix.gen.nz>
Message-ID: <20121129190813.5dc97298@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Manning,

On Fri, 30 Nov 2012 06:52:44 +1300, Charles Manning wrote:
> >   Maybe there's something fishy in your environment.  Can you run
> > env | grep /lib
> 
> Aaaarrrrggghhhh!!!!
> 
> I have this system set up to automatically set up for openembedded.
>  That defines PKG_CONFIG_PATH and adds some stuff to PATH which is probably 
> messing things up.
> 
> I turned off the openembedded auto configuration, nuked output/ and make ran 
> to completion.
> 
> I have now also learned a lot more about digging around in buildroot.

Wait, wait, could you please reproduce the problem, and reply to
Arnout's questions (sending us the output of env | grep /lib, or even
the entire output of env if it doesn't contain any sensitive
information).

I would like to this which environment variable was causing the
problem, and if we can add a check in Buildroot for this environment
variable, in order to avoid similar issues in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
