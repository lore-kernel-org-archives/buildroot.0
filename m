From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 7 Mar 2017 22:49:51 +0530
Subject: [Buildroot] QT5.8 buid failure on master
In-Reply-To: <CAOMZO5DMPYsXzftVtW_-Mv5PbK2h_=3atnQNku9ed6uxgw_ACg@mail.gmail.com>
References: <CAOMZO5D_R7_zEzL-X2zPViU+-SZ060JA3hpnE9S01x2PRazUsQ@mail.gmail.com>
 <trinity-a4f8806b-d789-4dea-928a-2d7bb2fad531-1488871993989@3capp-gmx-bs12>
 <20170307114826.lend2f2evnob3lya@t450s.lan>
 <trinity-b0ce3807-d5c4-4ccf-9b54-628667f6d805-1488895453975@3capp-gmx-bs26>
 <CAD6G_RQiqhvnYX3L9wh64K5inCSNr4G-vPDzU_9BbLqzrw=fyQ@mail.gmail.com>
 <CAOMZO5CPz7tLtLeLpC82koCrWx-gYRUGrZ-v-qjuZOZ3wbkaXw@mail.gmail.com>
 <CAD6G_RSPtn=Mta0sW67Ay8eAfHnvJ+tQ-pTMwJ1s6v_0Q24wzA@mail.gmail.com>
 <CAOMZO5DMPYsXzftVtW_-Mv5PbK2h_=3atnQNku9ed6uxgw_ACg@mail.gmail.com>
Message-ID: <CAD6G_RRiP7bABy+1Vm34DAVguU1VMBhhc_kzJ+DpBV4kAyWjjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 7, 2017 at 10:46 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Tue, Mar 7, 2017 at 2:11 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>> On Tue, Mar 7, 2017 at 10:27 PM, Fabio Estevam <festevam@gmail.com> wrote:
>>> Hi Jagan,
>>>
>>> On Tue, Mar 7, 2017 at 1:15 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>>>
>>>> Able to see the application but 'Black screen' on 'Lord of the Ring' widget
>>>
>>> Thanks for testing.
>>>
>>> I think we should treat this issue on a separate thread as I also see
>>> the same with Qt5.6.2.
>>
>> OK, so we need to investigate framebuffer issue? do you have any suggestions.
>
> If I understand correctly the same 4.9.13 kernel that you use with
> Gary's rootfs is able to launch the Qt5 Cinematic just fine, right?

Yes.

>
> So we need to understand what changed from Gary's rootfs compared to
> master that caused the regression.

Exactly, will let you know if I find any?

-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
