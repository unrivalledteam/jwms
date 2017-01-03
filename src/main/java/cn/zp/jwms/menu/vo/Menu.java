package cn.zp.jwms.menu.vo;

public class Menu {
    private String menuId;

    private String menuName;

    private String targetPage;

    private String belongMenuId;

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getTargetPage() {
        return targetPage;
    }

    public void setTargetPage(String targetPage) {
        this.targetPage = targetPage;
    }

    public String getBelongMenuId() {
        return belongMenuId;
    }

    public void setBelongMenuId(String belongMenuId) {
        this.belongMenuId = belongMenuId;
    }
}