From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 7 Mar 2017 20:29:50 +0100
Subject: [Buildroot] QT5.8 buid failure on master
In-Reply-To: <CAOMZO5CPz7tLtLeLpC82koCrWx-gYRUGrZ-v-qjuZOZ3wbkaXw@mail.gmail.com>
References: <CAOMZO5D_R7_zEzL-X2zPViU+-SZ060JA3hpnE9S01x2PRazUsQ@mail.gmail.com>
 <trinity-a4f8806b-d789-4dea-928a-2d7bb2fad531-1488871993989@3capp-gmx-bs12>
 <20170307114826.lend2f2evnob3lya@t450s.lan>
 <trinity-b0ce3807-d5c4-4ccf-9b54-628667f6d805-1488895453975@3capp-gmx-bs26>
 <CAD6G_RQiqhvnYX3L9wh64K5inCSNr4G-vPDzU_9BbLqzrw=fyQ@mail.gmail.com>
 <CAOMZO5CPz7tLtLeLpC82koCrWx-gYRUGrZ-v-qjuZOZ3wbkaXw@mail.gmail.com>
Message-ID: <20170307202950.61328dd5@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

On Tue, 7 Mar 2017 13:57:39 -0300, Fabio Estevam <festevam@gmail.com> wrote:

> Hi Jagan,
> 
> On Tue, Mar 7, 2017 at 1:15 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> 
> > Able to see the application but 'Black screen' on 'Lord of the Ring' widget
> 
> Thanks for testing.
> 
> I think we should treat this issue on a separate thread as I also see
> the same with Qt5.6.2.
> 
> It seems we made progress with Qt5.8 with Peter's patches.
> 
> Peter,
> 
> Do you plan to submit your two patches formally?

Yes can do. No problem with the first one, for the second one I need
to investigate first on which additional configure option the building
of libQt5EglFsKmsSupport.so depends...

Regards,
Peter

> 
> Thanks
