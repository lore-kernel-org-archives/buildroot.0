From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 28 Oct 2011 08:18:06 +0200
Subject: [Buildroot] Any plans to add ipkg/opkg to generate *.ipk/*.opk
 after package compilation?
In-Reply-To: <CA+hj=Mq22h7gimL16fxF4N67X+MqU0V4Cw4jak9pFF-K=512Jg@mail.gmail.com>
References: <CA+hj=Mq22h7gimL16fxF4N67X+MqU0V4Cw4jak9pFF-K=512Jg@mail.gmail.com>
Message-ID: <CAAXf6LXjhix4mweM-NNqOCeVgKps+hW73Yt09P5_+NUrkFKqEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivan,

On Thu, Oct 27, 2011 at 6:25 PM, Ivan Wagner <ivan.wagner@gmail.com> wrote:
> Dear All,
>
> are there any plans to add support for automatic ipk/opk files
> creation after the package's compilation process?

Buildroot currently doesn't monitor which files are installed by each
package. I think that this is a prerequisite for ipkg/opkg.

The question was raised whether we should modify this, see the thread
'Some topics for the Buildroot Developer Day':
http://lists.busybox.net/pipermail/buildroot/2011-October/046998.html

The Buildroot developer day is tomorrow, Saturday. We'll have to see
what the outcome of this topic is.

Best regards,
Thomas
